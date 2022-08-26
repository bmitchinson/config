[ -z "$config_repo" ] && export config_repo="${HOME}/repos/config"

echo "🗂 - Backing up files before restore"

mkdir -p "${HOME}/config_backup/"

cp "${HOME}/.gitconfig" "${HOME}/config_backup/.gitconfig"
cp "${HOME}/.gitignore_global" "${HOME}/config_backup/.gitignore_global"

cp "${HOME}/.p10k.zsh" "${HOME}/config_backup/.p10k.zsh"

cp "${HOME}/.zshrc" "${HOME}/config_backup/.zshrc"

echo "🔁 - Copying from bmitchinson/config to ${HOME}"

cp $config_repo/prefs/.gitconfig "${HOME}/.gitconfig"
cp $config_repo/prefs/.gitignore_global "${HOME}/.gitignore_global"

cp $config_repo/prefs/.p10k.zsh "${HOME}/.p10k.zsh"

cp $config_repo/prefs/.zshrc "${HOME}/.zshrc"

echo "✅ - Done! Reopen your terminal"