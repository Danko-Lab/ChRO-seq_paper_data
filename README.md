ChRO-seq_paper_data
========

* This repository contains the TRE data reported in the ChRO-seq paper "Chromatin run-on and sequencing maps the transcriptional regulatory landscape of glioblastoma multiforme" in Nature Genetics (https://www.nature.com/articles/s41588-018-0244-3).


GBM_TRE
-------
This directory contains TREs called by dREG.HD under the stringent criterion. They reprent active enhancers and promoters identified using ChRO-seq data. (The coordinate is hg19).

23samples.tsTRE
-------
This directory contains bed files of tumor-associated TREs (taTRE).
* bed.files : taTRE identified in each primary GBM/pdx sample by excluding DHS sites from normal adult brain samples from TREs in GBM_TRE. This corresponds to the statistics reported in supplementary table 4 of the ChRO-seq paper.
* bad.regions: blacklisted regions reported by ENCODE project.
* all.merged.bed:  taTREs merged across samples in bed.files followed by excluding the set in bad.regions. 


