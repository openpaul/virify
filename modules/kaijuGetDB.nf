process kaijuGetDB {
  label 'kaiju'    
  if (params.cloudProcess) { 
    publishDir "${params.cloudDatabase}/kaiju/", mode: 'copy', pattern: "nr_euk" 
  }
  else { 
    storeDir "nextflow-autodownload-databases/kaiju/" 
  }  

  output:
    file("nr_euk")

  script:
    """
    wget http://kaiju.binf.ku.dk/database/kaiju_db_nr_euk_2019-06-25.tgz 
    tar -xvzf kaiju_db_nr_euk_2019-06-25.tgz
    rm kaiju_db_nr_euk_2019-06-25.tgz
    mkdir nr_euk
    //mv names.dmp nodes.dmp viruses nr_euk
    """
}


