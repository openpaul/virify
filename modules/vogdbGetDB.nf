process vogdbGetDB {
  label 'basics'    
  if (params.cloudProcess) { 
    publishDir "${params.cloudDatabase}/", mode: 'copy', pattern: "vogdb" 
  }
  else { 
    storeDir "nextflow-autodownload-databases/" 
  }  

  output:
    file("vogdb")

  script:
    """
    wget -nH ftp://ftp.ebi.ac.uk/pub/databases/metagenomics/viral-pipeline/databases/vogdb.tar.gz && tar -zxvf vogdb.tar.gz
    rm vogdb.tar.gz
    """
}