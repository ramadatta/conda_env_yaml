conda create -n spipe python=3.10
conda activate spipe
unzip ParseBiosciences-Pipeline.1.0.5p.zip 
cd ParseBiosciences-Pipeline.1.0.5p/
bash ./install_dependencies_conda.sh -i -y
pip install --no-cache-dir ./
./split-pipe -h
