export config_repo="${HOME}/repos/config"

cp "${HOME}/.gitconfig" $config_repo/prefs/.gitconfig
cp "${HOME}/.gitignore_global" $config_repo/prefs/.gitignore_global

cp "${HOME}/.p10k.zsh" $config_repo/prefs/.p10k.zsh

cp "${HOME}/.zshrc" $config_repo/prefs/.zshrc