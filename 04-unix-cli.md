Оригинальная [презентация](https://mail.yandex.ru/disk/public/?hash=pcx9FvQ88XZe3XA6k%2BwNI1P8A6jWU7CYbsHJZ7vsF%2B4%3D).

Ещё интересные лекции Виктора:

- [Популярный Linux](http://events.yandex.ru/talks/105/)
- [Операционные системы](http://events.yandex.ru/talks/94/)
- [Сети и протоколы](http://events.yandex.ru/talks/99/)

**Домашнее задание**

Написать сценарий, который находит все файлы не входящие в SVN/Git и перемещает их в ~/.Trash/.

    git ls-files . --exclude-standard --others -z | xargs -0 -I {} mv {} ~/.Trash/

присылайте пулл реквесты с решением для SVN или с более элегантным подходом.

Задание можно понять двояко. Можно искать файлы, не вохдящие в репозитарий с помощью svn info 
(всякую статику типа картинок, .htaccess и пр.), тогда вариант такой:

#!/bin/bash
for x in $( find / -type f )
do
error=$(svn info $x 2>&1 |grep "Not a versioned resource");
if [ "$error" != "" ]; then
    mv $x ~/.Trash/
fi
done

но потом в комментариях на я.ру отписался mishanga и я понял, 
что задание можно понимать еще и так, что надо переместить все 
файлы, измененные или добавленные в проект, но не закаченные на сервер. 
Решение от mishanga, конечно, более элегантное :))

svn st | grep ? | awk '{print $2}' | xargs -J % mv % ~/.Trash/