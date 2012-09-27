Оригинальная [презентация](https://mail.yandex.ru/disk/public/?hash=pcx9FvQ88XZe3XA6k%2BwNI1P8A6jWU7CYbsHJZ7vsF%2B4%3D).

Ещё интересные лекции Виктора:

- [Популярный Linux](http://events.yandex.ru/talks/105/)
- [Операционные системы](http://events.yandex.ru/talks/94/)
- [Сети и протоколы](http://events.yandex.ru/talks/99/)

**Домашнее задание**

Написать сценарий, который находит все файлы не входящие в SVN/Git и перемещает их в ~/.Trash/.

    git ls-files . --exclude-standard --others -z | xargs -0 -I {} mv {} ~/.Trash/

присылайте пулл реквесты с решением для SVN или с более элегантным подходом.

Скрипт с сохранением структуры каталогов. В первом параметре необходимо передать путь до Git репозитория, во втором - путь до папки
назначения:

    #!/bin/bash

    if [[ "$1" = "" || "$2" = "" ]]
    then
        echo "Указаны не все аргументы"
        exit 0
    fi
    
    repopath=$(readlink -e "$1")/ #Вычисляем абсолютный путь до папки с репом
    trashpath=$(readlink -e "$2")/ #Вычисляем абсолютный путь до папки с трешэм
    
    cd "$repopath"
    IFS=$'\n'
    for line in $(git ls-files -o --exclude-standard); do
        cd "$trashpath" && mkdir -p $(dirname "$line") && mv "$repopath""$line" "$trashpath""$(dirname "$line")"/
    done
    echo "Успешно"
