;;; rename-file-and-buffer
(defun brice-rename-file-and-buffer () 
  "Rename the current buffer and file it is visiting.
   URL 'http://emacsredux.com/blog/2013/05/04/rename-file-and-buffer/'
  "
  (interactive)
  (let ((filename (buffer-file-name)))
    (if (not (and filename (file-exists-p filename)))
        (message "Buffer is not visiting a file!")
      (let ((new-name (read-file-name "New name: " filename)))
        (cond
         ((vc-backend filename) (vc-rename-file filename new-name))
         (t
          (rename-file filename new-name t)
          (set-visited-file-name new-name t t)))))))

;;; delete-file-and-buffer
(defun brice-delete-file-and-buffer () 
  "Kill the current buffer and deletes the file it is visiting.
  URL 'http://emacsredux.com/blog/2013/04/03/delete-file-and-buffer/'
  "p
  (interactive)
  (let ((filename (buffer-file-name)))
    (when filename
      (if (vc-backend filename)
          (vc-delete-file filename)
        (progn
          (delete-file filename)
          (message "Deleted file %s" filename)
          (kill-buffer))))))

;;; create .sh file
(defun brice-create-sh-file ()
  "Create a .sh file"
  (interactive)
  (let ((currentPath default-directory))	
	(let ((currentFile buffer-file-name))
	  (if (not (null currentFile)) (setq currentFile (replace-regexp-in-string "BATCH_" "" (file-name-sans-extension (file-name-nondirectory currentFile)))))
	  (let ((directory (read-string "Directory:" currentPath)))	  
		(let ((filename (read-string "Enter the name of the .sh file (without extension):" currentFile)))
		  (let ((nJob (read-string "Enter the number of jobs:" "10")))
			(let ((queue (read-string "Enter the queue [all/long], long meaning >8h:" "all")))
			  (let ((nMemory (read-string "Enter the memory reserved for each job (in GB):" "1")))
				(let ((filenameExt (concat "SUBM_" filename ".sh" )))
				  (find-file (concat directory filenameExt))
				  (append-to-file (concat "#!/bin/bash

#$ -N " filename "  # Job name
#$ -t 1:" nJob "     # Number of jobs
#$ -q " queue ".q    # Queue. Use long.q for run time >8h and all.q otherwise
#$ -l h_vmem=" nMemory "G # Memory limit, e.g. reserve 1 GB memory 
#$ -tc 128      # Max concurrent jobs
#$ -cwd         # Run in current directory
#$ -o output/" filename "/   # Direct output to subdirectory
#$ -e output/" filename "/   # Direct output to subdirectory

R CMD BATCH BATCH_" filename ".R output/" filename "/$JOB_NAME-I-$SGE_TASK_ID.Rout --no-restore --no-save

## go to directory    ## cd " currentPath "
## clean outputs      ## rm -r ./output/" filename "/*
## clean results      ## rm -r ./Results/" filename "/*
## submission command ## qsub SUBM_" filename ".sh

## submission output  ## Your job-array xxxxx.x-xxx:x (" filename ") has been submitted
## submission time    ## xx/xx/xx x:xx 

## documentation      ## https://ifsv.sund.ku.dk/biostat/biostatwiki/index.php/IT:Cluster
                      ## http://bayes/ganglia : current load and history can be monitored graphically at
                      ## qstat -f -u \*        : view the cluster queue type (the first column shows the job id)
                      ## qstat -j 1034        : show details of a job (or job array) with job id 1034 type     
                      ## qdel 1034            : delete the job with job id 1034 from the queue type
") nil filenameExt)
				))))))))
  )

;;; create BATCH.R file
(defun brice-create-BATCH-R-file ()
  "Create a BATCH.R file"
  (interactive)
  (let ((currentPath default-directory))
	(let ((directory (read-string "Directory:" currentPath)))	  
	  (let ((filename (read-string "Enter the name of the .R file (without extension):" )))
		(let ((filenameExt (concat "BATCH_" filename ".R" )))
		  (find-file  (concat directory filenameExt))
	(append-to-file (concat "
# path <- \"" currentPath "\"
# setwd(path)
# source(\"" filenameExt "\")

rm(list = ls())
gc()

## * seed
iter_sim <- as.numeric(Sys.getenv(\"SGE_TASK_ID\"))
n.iter_sim <- as.numeric(Sys.getenv(\"SGE_TASK_LAST\"))
if(is.na(iter_sim)){iter_sim <- 1}
if(is.na(n.iter_sim)){n.iter_sim <- 10}
cat(\"iteration \",iter_sim,\" over \",n.iter_sim,\"\\n\",sep=\"\")

set.seed(1)
seqSeed <- sample(1:max(1e5,n.iter_sim),size=n.iter_sim,replace=FALSE)
iSeed <- seqSeed[iter_sim]
set.seed(iSeed)

cat(\"seed: \",iSeed,\"\\n\")

## * path
path <- \".\"
path.res <- file.path(path,\"Results\",\"" filename "\")
if(dir.exists(path.res)==FALSE){
    dir.create(path.res)
}
path.output <- file.path(path,\"output\",\"" filename "\")
if(dir.exists(path.output)==FALSE){
    dir.create(path.output)
}

## * libraries

## * settings
n.sim <- 100

## * job
res <- NULL
for(iSim in 1:n.sim){
    iRes <- data.frame(Y=rnorm(1))
    res <- rbind(res, iRes)

    saveRDS(res, file = file.path(path.res,paste0(\"simul_\",iter_sim,\"(tempo).rds\")))
}

## * export
saveRDS(res, file = file.path(path.res,paste0(\"simul_\",iter_sim,\".rds\")))

## * display
print(sessionInfo())

## * gather and process results
if(FALSE){
path <- \"" currentPath "\"
setwd(path)

path."filename" <- file.path(\"Results\",\""filename"\")
allRes.tempo <- butils::sinkDirectory(path."filename", string.keep = \"tempo\")
allRes.final <- butils::sinkDirectory(path."filename", string.exclude = \"tempo\")
}

	") nil filenameExt)
	))))
  )


;;; photo-raw-to-png
(defun brice-photo-raw-to-png ()
  "Convert raw file to readable files"
  (interactive)
  (if (eq major-mode 'shell-mode)
      (let ((formatIn (read-string "Enter an input format:" "*.raw")))
		(let ((eraseRaw (read-string "Remove input files at the end [true/false]:" "false")))
		  (let ((formatOut (read-string "Enter an output format:" "png")))
			(if(string= "jpeg" formatOut)
				(let ((compression (read-string "Enter a quality factor [0-100]:" "85")))
				  (insert (concat "ufraw-batch " formatIn " --silent --out-type=" formatOut " --compression=" compression))
				  )
		      (insert (concat "ufraw-batch " formatIn " --silent --out-type=" formatOut))		  
		      )
			(if(string= "true" eraseRaw)
				(insert (concat "\n rm " formatIn))
			  )
			)))
    ))


