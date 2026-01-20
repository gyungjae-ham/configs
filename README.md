# Config 파일 모음
## vimrc 파일 설정 시 주의사항(이것도 vimrc 안쓰고 사실 lazyvim 써서 안해도 됨)
1. 먼저 `neovim`을 설치한다
2. vim-plug install neovim을 검색해서 `vim-plug`를 설치한다
3. ~/.config/nvim/init.vim 안에 파일을 복사해서 적용한다(vimrc를 생성하지 않아도 됨)

## zsh-hangul(이거 별로인듯 이제 안씀)
```
git clone https://github.com/gomjellie/zsh-hangul ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-hangul
```

~/.zshrc에
```
plugins=(
    git
+   zsh-hangul
)
```

## vimium 두 가지 버전
- 너무 많은 설정해 놓으면 글 입력하다가 다른 페이지로 날라가는 이슈가 있어서 `minimum` 버전 생성함

## 키입력 속도 설정
```shell
defaults write -g ApplePressAndHoldEnabled -bool false
defaults write -g InitialKeyRepeat -int 10
defaults write -g KeyRepeat -int 1
```

## neovim, nvim 설치한 후
- neovim-minimum이 지금 가장 적당한 설정입니다
