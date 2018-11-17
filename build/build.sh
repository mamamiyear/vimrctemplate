#!/bin/bash

cur_dir=$(cd $(dirname $0); pwd)
src_dir=$cur_dir/../src
release_dir=$cur_dir/../release

cd ${cur_dir}

[ -d ${release_dir} ] || mkdir ${release_dir}

src_file=(vimrc.title vimrc.plugin vimrc.basic)

touch vimrc.temp

for vimrc in ${src_file[@]}
do
    cat ${src_dir}/${vimrc} >> vimrc.temp
    echo "build: ${vimrc}"
#ls ${src_dir}/ | grep vimrc_ | xargs -I {} cat ${src_dir}/{} >> vimrc.temp
done

time=$(date "+%Y%m%d%H%M%S")
cp vimrc.temp ${release_dir}/vimrc_${time}
echo "output: ${release_dir}/vimrc_${time}"

rm vimrc.temp >> /dev/null

cd - >> /dev/null

