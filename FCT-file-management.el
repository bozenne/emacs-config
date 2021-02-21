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

## documentation      ## https://ifsv.sund.ku.dk/biostat/biostatwiki/index.php/IT:Cluster : biostat wiki about the cluster
                      ## http://gridscheduler.sourceforge.net/htmlman/manuals.html : grid engine manual 
                      ## http://bayes/ganglia                                      : current load and history of the cluster

## commands           ## qstat         : view jobs of the user
                      ## qstat -u \*   : view jobs of all users (the first column shows the job id)
                      ## qstat -j 1034 : show details of a job (or job array) with job id 1034 type     
                      ## qdel 1034     : delete the job with job id 1034 from the queue type
                      ## finger login  : get the name corresponding to the login

## status             ## qw : quewing
                      ##  r : running
                      ## dr : dual state (r)unning and being (d)eleted
") nil filenameExt)
				))))))))
  )

;;; create .slurm file
(defun brice-create-slurm-file ()
  "Create a .slurm file"
  (interactive)
  (let ((currentPath default-directory))	
	(let ((currentFile buffer-file-name))
	  (if (not (null currentFile)) (setq currentFile (replace-regexp-in-string "BATCH_" "" (file-name-sans-extension (file-name-nondirectory currentFile)))))
	  (let ((directory (read-string "Directory:" currentPath)))	  
		(let ((filename (read-string "Enter the name of the .slurm file (without extension):" currentFile)))
		  (let ((nJob (read-string "Enter the number of jobs:" "10")))
			(let ((queue (read-string "Enter the queue [standard/long], long meaning >8h:" "standard")))
			  (let ((nMemory (read-string "Enter the memory reserved for each job (in GB):" "1")))
				(let ((filenameExt (concat "SUBM_" filename ".slurm" )))
				  (find-file (concat directory filenameExt))
				  (append-to-file (concat "#!/bin/bash

#SBATCH --job-name=" filename "  # Job name
#SBATCH --array=1-" nJob "     # Number of jobs
#SBATCH --partition=" queue "    # Queue. Use long for run time >8h and standard otherwise
#SBATCH --mem=" nMemory "G # Memory limit, e.g. reserve 1 GB memory 
#SBATCH --output=output/" filename "/slurm-%x-%a-%J.out # Direct output to subdirectory
#SBATCH --error=output/" filename "/slurm-%x-%a-%J.out # Same file for output and error

R CMD BATCH --vanilla BATCH_" filename ".R output/" filename "/R-$SLURM_JOB_NAME-$SLURM_ARRAY_TASK_ID-$SLURM_JOB_ID.Rout

## go to directory    ## cd " currentPath "
## clean outputs      ## rm -r ./output/" filename "/*
## clean results      ## rm -r ./Results/" filename "/*
## submission command ## sbatch SUBM_" filename ".slurm

## submission output  ## Submitted batch job 41537 (time using C-c t: XX/XX/XX X:XX) 

## commands           ## squeue           : view current jobs 
                      ## squeue -u id     : view current jobs for user id
                      ## scancel          : delete the job with job id 1034 from the queue type
                      ## sinfo            : view state of the queues
                      ## sshare           : check own usage of the server

## documentation      ## from SLURM: https://slurm.schedmd.com/pdfs/summary.pdf: key functions
                      ##           : https://slurm.schedmd.com/sbatch.html (filename pattern)
                      ## from KU   : https://hpc.ku.dk/documentation/slurm.html
") nil filenameExt)
				  ))))))))
  (revert-buffer nil t)
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
			(append-to-file (concat "## * Header 
## path <- \"" currentPath "\"
## setwd(path)
## source(\"" filenameExt "\")
## sbatch -a 1-1 -J '" filename"' --output=/dev/null --error=/dev/null R CMD BATCH --vanilla " filenameExt " /dev/null 

rm(list = ls())
gc()

## * seed
iter_sim <- as.numeric(Sys.getenv(\"SLURM_ARRAY_TASK_ID\"))
n.iter_sim <- as.numeric(Sys.getenv(\"SLURM_ARRAY_TASK_COUNT\"))
if(is.na(iter_sim)){iter_sim <- 1}
if(is.na(n.iter_sim)){n.iter_sim <- 10}
cat(\"iteration \",iter_sim,\" over \",n.iter_sim,\"\\n\",sep=\"\")

set.seed(1)
seqSeed <- sample(1:max(1e5,n.iter_sim),size=n.iter_sim,replace=FALSE)
iSeed <- seqSeed[iter_sim]
set.seed(iSeed)

cat(\"seed: \",iSeed,\"\\n\")

## * prepare export
path <- \".\"
path.res <- file.path(path,\"Results\",\"" filename "\")
if(dir.exists(path.res)==FALSE){
    if(dir.exists(file.path(path,\"Results\"))==FALSE){
    dir.create(file.path(path,\"Results\"))
    }
    dir.create(path.res)
}
path.output <- file.path(path,\"output\",\"" filename "\")
if(dir.exists(path.output)==FALSE){
    if(dir.exists(file.path(path,\"output\"))==FALSE){
    dir.create(file.path(path,\"output\"))
    }
    dir.create(path.output)
}

## * libraries

## * settings
n.sim <- 100

## * function to execute
res <- NULL
for(iSim in 1:n.sim){
    iRes <- data.frame(Y=rnorm(1))
    res <- rbind(res, iRes)

    saveRDS(res, file = file.path(path.res,paste0(\"simul_\",iter_sim,\"(tempo).rds\")))
}

## * export
saveRDS(res, file = file.path(path.res,paste0(\"simul_\",iter_sim,\".rds\")))

## * R version
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
  (revert-buffer nil t)
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


