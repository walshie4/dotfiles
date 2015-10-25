#!/usr/bin/env bash
PATHOGEN_DIR="${HOME}/.vim/autoload"
BUNDLES_DIR="${HOME}/.vim/bundle"

if [[ -d "${PATHOGEN_DIR}" ]]; then
  echo "Updating pathogen..."
  curl -LSo ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
fi

if [[ -d "${BUNDLES_DIR}" ]]; then
  echo "Updating bundles..."
  for bundle in "${BUNDLES_DIR}/"*; do
    if [[ -d "${bundle}/.git" ]]; then
      echo "Bundle: ${bundle}..."
      cd "${bundle}"
      git pull
    fi
  done
fi