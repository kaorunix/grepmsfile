#!/bin/bash

if [ "$#" -ne 2 ]; then
  echo "Usage $0 target_dir text_dir"
  echo "     target_dir: which directory contains Office files such as xlxs, pptx, also pdf"
  echo "     text_dir: which directory you want export text files from Office files"
fi


CURRENT=$(pwd)

TARGETPATH=$(cd "$1" && pwd)
cd $CURRENT
OUTPUTBASE=$(cd "$2" && pwd)
cd $CURRENT

CMD=$0

echo $TARGETPATH
cd "${TARGETPATH}"
TOPDIR=$(basename "$TARGETPATH")
echo "TOPDIR=$TOPDIR"
OUTPUTPATH="${OUTPUTBASE}/${TOPDIR}"
echo "${OUTPUTPATH}"
mkdir -p "${OUTPUTPATH}"

echo "enter $TARGETPATH..."
for path in *
do
    echo "$path"
    if [ -d "${path}" ];then
	$CMD "${path}" "${OUTPUTPATH}"
	echo ""
    elif [[ $path == "~$"* ]]; then
	echo "ignore"
    elif [[ $path == *".xlsx" ]] || [[ $path == *".pptx" ]] || [[ $path == *".docx" ]] || [[ $path == *".pdf" ]]; then
	FILENAME="${OUTPUTPATH}/${path}"
	echo "processing ${FILENAME}"
	tika.sh "${path}" > "${FILENAME}.txt"
    fi
done

