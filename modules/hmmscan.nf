process hmmscan {
      publishDir "${params.output}/${name}/", mode: 'copy', pattern: "${set_name}_hmmscan.tbl"
      label 'hmmscan'

    input:
      tuple val(name), val(set_name), file(faa) 
      file(db)
    
    output:
      tuple val(name), val(set_name), file("${contig_set_name}_hmmscan.tbl")
    
    shell:
    """
      hmmscan --cpu ${task.cpus} --noali -E "0.001" --domtblout ${set_name}_hmmscan.tbl ${db}/vpHMM_database ${faa}
    """
}
