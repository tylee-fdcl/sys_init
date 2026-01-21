# Python Installation on Mac



* Install Homebrew

* Install `pyenv`: https://github.com/pyenv/pyenv#homebrew-in-macos (.zshrc has to be updated)

* Install `pyenv-virtualenv`: https://github.com/pyenv/pyenv-virtualenv (.zshrc has to be updated)

* Install `python` using `pyenv`

  ```
  pyenv install 3.14
  pyenv global 3.14
  pyenv version
  ```

  Do NOT install python from homebrew, i.e. ``brew install python3`` should be avoided

* Create virtual environment, list all envs, and activate one

  ```
  pyenv virtualenv <env_name>
  pyenv virtualenvs
  pyenv activate <env_name>
  ```

* Install packages

  ```pip3 
  pip3 install torch
  ```

* Deactiavte virtual environment

  ``source deactivate``

  