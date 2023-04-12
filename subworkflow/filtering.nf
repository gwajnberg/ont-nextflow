process FILTERING {

    input:
        val(datadir)
        val(length)
        val(qcscore)

    output:
        val(datadir)

    script:

        """
        fastqc -o ~/ /mnt/NAS/nanopore_runs/${datadir}/${datadir}.fastq.gz
        gunzip -c ${datadir}.fastq.gz| chopper -q ${qcscore} --minlength ${length} -t 30 | gzip > ~/${datadir}_filtered.fastq.gz
        fastqc -o ~/ ~/${datadir}_filtered.fastq.gz
        """

}
