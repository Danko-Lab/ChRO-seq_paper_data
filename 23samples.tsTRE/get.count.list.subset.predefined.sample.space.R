
#get count.list (matrix storing the state of activation of TRE for each sample in bed format)
#saves a count.list.rdata file in the current directory
#arguments 1 =working_dir which specifies the path the the bed files
#arguments 2 =path to the sample space

get.count.list<-function(working_dir, sample.space){
	bed.files<-list.files(path= working_dir,pattern="*.bed",full.names=T)

	bed.files.names<-list.files(path= working_dir,pattern="*.bed")

	#constructing sample space
	parentdir<-system(paste("echo $(dirname", working_dir,")"),intern=T)
	system(paste("cat ", sample.space," | LC_COLLATE=C sort -k1,1 -k2,2n | mergeBed -i stdin | bedtools intersect -v -a stdin -b /workdir/tc532/manuscript_code/database/brain_subset/bad.regions/consensusBlacklist.bed  | bedtools intersect -v -a stdin -b /workdir/tc532/manuscript_code/database/brain_subset/bad.regions/wgEncodeDukeMapabilityRegionsExcludable.bed > ", parentdir, "/all.merged.bed",sep=""))


	count.list<-list()
	for (i  in 1:length(bed.files)){
		print(i)
		command<-paste("bedtools intersect -c -a all.merged.bed -b ", bed.files[i], " | awk 'BEGIN{OFS=\"\t\"} {if($4>0) {print 1;} else {print 0}}'" ,sep="")
		counts<-as.numeric(system(command,intern=T))
		count.list[[bed.files[i]]]<-counts
	}

	names(count.list)<-bed.files.names
	return(count.list)

}


args=(commandArgs(TRUE))
working_dir = args[1]
sample.space=args[2]

parentdir<-system(paste("echo $(dirname", working_dir,")"),intern=T)

count.list<-get.count.list(working_dir, sample.space)
save(count.list,file=paste(parentdir,"/count.list.rdata",sep=""))


