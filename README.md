# Subread

Description
===========

Cookbook for installing the Subread package: high-performance read alignment, quantification and mutation discovery

The Subread package comprises a suite of software programs for processing next-gen sequencing read data including:

Subread: an accurate and efficient aligner for mapping both genomic DNA-seq reads and RNA-seq reads (for the purpose of expression analysis).
Subjunc: an RNA-seq aligner suitable for all purposes of RNA-seq analyses.
featureCounts: a highly efficient and accurate read summarization program.
exactSNP: a SNP caller that discovers SNPs by testing signals against local background noises.
These programs were also implemented in Bioconductor R package RSubread.

http://Subread.sourceforge.net/

Requirements
============

## Platform:

* Centos 6.5

Usage
=====
Simply include the recipe wherever you would like it installed, such as a run list (recipe[Subread]) or a cookbook (include_recipe 'Subread')

## Testing

kitchen converge default-centos65 | tee kitchen.log

kitchen login default-centos65

kitchen verify default-centos65

kitchen destroy default-centos65
    
License and Authors
===================

* Authors:: Bart Ailey (<chef@eaglegenomics.com>)
* Authors:: Dan Barrel (<chef@eaglegenomics.com>)
* Authors:: Nick James (<chef@eaglegenomics.com>)

Attributes
==========
See attributes/default.rb for default values.

default['Subread']['version']
    
Copyright:: 2015, Eagle Genomics.
    
Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
    
ToDo
====
    
