if [[ ! -d ~/.cargo ]]; then
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | bash -s -- --profile default --no-modify-path -y
fi

cp -f files/30-rust.sh "$SYSTEM_RC"/30-rust.sh
