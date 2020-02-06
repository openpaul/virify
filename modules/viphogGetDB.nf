process viphogGetDB {
  label 'noDocker'    
  if (params.cloudProcess) { 
    publishDir "${params.cloudDatabase}/", mode: 'copy', pattern: "vpHMM_database" 
  }
  else { 
    storeDir "nextflow-autodownload-databases/" 
  }  

  output:
    file("vpHMM_database")

  script:
    """
    wget -nH ftp://ftp.ebi.ac.uk/pub/databases/metagenomics/viral-pipeline/hmmer_databases/vpHMM_database.tar.gz && tar -zxvf vpHMM_database.tar.gz
    rm vpHMM_database.tar.gz
    """
}


 // roughly 3 GB size