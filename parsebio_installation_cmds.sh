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

