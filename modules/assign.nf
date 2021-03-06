process assign {
      publishDir "${params.output}/${name}/${params.taxdir}", mode: 'copy', pattern: "*tax_assign.tsv"
      publishDir "${params.output}/${name}/${params.finaldir}/taxonomy", mode: 'copy', pattern: "*tax_assign.tsv"
      label 'assign'

    input:
      tuple val(name), val(set_name), file(tab)
      file(db)
    
    output:
      tuple val(name), val(set_name), file("*tax_assign.tsv")
    
    shell:
    """
    contig_taxonomic_assign.py -i ${tab} -d ${db}
    """
}

/*
	'''This function takes the annotation table generated by viral_contig_maps.py and generates a table that
	   provides the taxonomic lineage of each viral contig, based on the corresponding ViPhOG annotations'''

*/