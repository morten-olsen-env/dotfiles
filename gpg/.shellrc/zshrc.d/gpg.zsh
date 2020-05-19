secret () {
  output="${1}".$(date +%s).enc
  gpg --encrypt --armor --output ${output} -r 0x95725F7DB99B3345 "${1}" && echo "${1} -> ${output}"
}

reveal () {
  output=$(echo "${1}" | rev | cut -c16- | rev)
  gpg --decrypt --output ${output} "${1}" && echo "${1} -> ${output}"
}
