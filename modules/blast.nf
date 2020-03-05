process blast {
      publishDir "${params.output}/${assembly_name}/${params.blastdir}/", mode: 'copy', pattern: "*.blast"
      label 'blast'

    input:
      tuple val(assembly_name), val(confidence_set_name), file(fasta) 
      file(db)
    
    output:
      tuple val(assembly_name), val(confidence_set_name), file("${confidence_set_name}.blast"), file("${confidence_set_name}.filtered.blast")
    
    shell:
    """
      HEADER_BLAST="qseqid\\tsseqid\\tpident\\tlength\\tmismatch\\tgapopen\\tqstart\\tqend\\tqlen\\tsstart\\tsend\\tevalue\\tbitscore\\tslen"
      printf "\$HEADER_BLAST\\n" > ${confidence_set_name}.blast

      blastn -task blastn -num_threads ${task.cpus} -query ${fasta} -db IMG_VR_2018-07-01_4/IMGVR_all_nucleotides.fna -evalue 1e-10 -outfmt "6 qseqid sseqid pident length mismatch gapopen qstart qend qlen sstart send evalue bitscore slen" >> ${confidence_set_name}.blast
      awk '{if(\$4>0.8*\$9){print \$0}}' ${confidence_set_name}.blast >> ${confidence_set_name}.filtered.blast
    """
}
