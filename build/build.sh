#!/bin/bash

cur_dir=$(cd $(dirname $0); pwd)
src_dir=$cur_dir/../src
output_dir=$cur_dir/../release
backup_dir=$cur_dir/../backup

cd ${cur_dir}

[ -d ${output_dir} ] || mkdir ${output_dir}

src_file=(vimrc.title vimrc.plugin vimrc.basic vimrc.advanced)

touch vimrc.temp

for vimrc in ${src_file[@]}
do
    cat ${src_dir}/${vimrc} >> vimrc.temp
    echo "build: ${vimrc}"
done

time=$(date "+%Y%m%d%H%M%S")
cp vimrc.temp ${output_dir}/vimrc_${time}
echo "output: ${output_dir}/vimrc_${time}"


if [ -n "$1" -a "$1" = "activate" ]; then
    [ -d ${backup_dir} ] || mkdir ${backup_dir}
    cp ${HOME}/.vimrc ${backup_dir}/vimrc_${time}_backup
    cat vimrc.temp > ${HOME}/.vimrc
    echo "Activate new vimrc_${time} successfully. Original ${HOME}/.vimrc has been backup in ${backup_dir}/vimrc_${time}_backup"
fi

rm vimrc.temp >> /dev/null

cd - >> /dev/null

