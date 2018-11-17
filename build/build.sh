#!/bin/bash

cur_dir=$(cd $(dirname $0); pwd)
src_dir=$cur_dir/../src
release_dir=$cur_dir/../release

[ -d ${release_dir} ] || mkdir ${release_dir}

touch ${cur_dir}/vimrc.temp
ls ${src_dir}/ | grep vimrc_ | xargs -I {} cat ${src_dir}/{} >> vimrc.temp

time=$(date "+%Y%m%d%H%M%S")
cp vimrc.temp ${release_dir}/vimrc_${time}

rm vimrc.temp

