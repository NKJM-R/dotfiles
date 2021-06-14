package user

import (
	"errors"
	"os"
	"path/filepath"
)

type Profile struct {
	HomeDirectory string
	Editor        string
	Shell         string
	ShellRC       string
}

func GetProfile() *Profile {
	p := new(Profile)
	p.HomeDirectory = os.Getenv("HOME")
	p.Editor = os.Getenv("EDITOR")
	p.Shell = os.Getenv("SHELL")
	e := p.setShellRc()
	if e != nil {
		panic(e)
	}
	return p
}

func (p *Profile) setShellRc() error {
	switch filepath.Base(p.Shell) {
	case "bash":
		p.ShellRC = ".bashrc"
		return nil
	case "zsh":
		p.ShellRC = ".zshrc"
		return nil
	default:
		return errors.New("環境変数: $SHELLが未設定です")
	}
}
