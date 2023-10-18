conda create -n spipe python=3.10
conda activate spipe
unzip ParseBiosciences-Pipeline.1.0.5p.zip 
cd ParseBiosciences-Pipeline.1.0.5p/
bash ./install_dependencies_conda.sh -i -y
pip install --no-cache-dir ./
./split-pipe -h
mkdir genomes
cd genomes/
wget https://ftp.ensembl.org/pub/release-109/fasta/homo_sapiens/dna/Homo_sapiens.GRCh38.dna.primary_assembly.fa.gz;
wget https://ftp.ensembl.org/pub/release-109/gtf/homo_sapiens/Homo_sapiens.GRCh38.109.gtf.gz;
wget https://ftp.ensembl.org/pub/release-109/fasta/mus_musculus/dna/Mus_musculus.GRCm39.dna.primary_assembly.fa.gz;
wget https://ftp.ensembl.org/pub/release-109/gtf/mus_musculus/Mus_musculus.GRCm39.109.gtf.gz;
split-pipe \
--mode mkref \
--genome_name hg38 \
--fasta genomes/Homo_sapiens.GRCh38.dna.primary_assembly.fa.gz \
--genes genomes/Homo_sapiens.GRCh38.109.gtf.gz \
--output_dir genomes/hg38

ls
-rwxr-xr-x 1 ramadatta ramadatta 6,9G Sep 30 02:33 23L008212_S1_L001_R1_001.fastq.gz
-rwxr-xr-x 1 ramadatta ramadatta 8,1G Sep 30 02:36 23L008212_S1_L001_R2_001.fastq.gz
-rwxr-xr-x 1 ramadatta ramadatta 7,0G Sep 30 02:54 23L008212_S1_L002_R1_001.fastq.gz
-rwxr-xr-x 1 ramadatta ramadatta 8,4G Sep 30 02:57 23L008212_S1_L002_R2_001.fastq.gz

cat 23L008212_S1_L001_R1_001.fastq.gz 23L008212_S1_L002_R1_001.fastq.gz >23L008212_S1_L001_002_R1_001.fastq.gz
cat 23L008212_S1_L001_R2_001.fastq.gz 23L008212_S1_L002_R2_001.fastq.gz >23L008212_S1_L001_002_R2_001.fastq.gz

cat 23L008213_S2_L001_R1_001.fastq.gz 23L008213_S2_L002_R1_001.fastq.gz >23L008213_S2_L001_002_R1_001.fastq.gz
cat 23L008213_S2_L001_R2_001.fastq.gz 23L008213_S2_L002_R2_001.fastq.gz >23L008213_S2_L001_002_R2_001.fastq.gz

split-pipe --mode all --chemistry v2 -g /home/ramadatta/sw/ParseBiosciences-Pipeline.1.0.5p/genomes/hg38 --fq1 Sample_23L008212/23L008212_S1_L001_002_R1_001.fastq.gz --fq2 Sample_23L008212/23L008212_S1_L001_002_R2_001.fastq.gz --output_dir /home/ramadatta/Analysis/1_Schiller_Lab/Projects/Misc/Parse_Bio_Data_Analysis/Sample_23L008212 
split-pipe --mode all --chemistry v2 -g /home/ramadatta/sw/ParseBiosciences-Pipeline.1.0.5p/genomes/hg38 --fq1 Sample_23L008213/23L008213_S2_L001_002_R1_001.fastq.gz --fq2 Sample_23L008213/23L008213_S2_L001_002_R2_001.fastq.gz --output_dir /home/ramadatta/Analysis/1_Schiller_Lab/Projects/Misc/Parse_Bio_Data_Analysis/Sample_23L008213 
