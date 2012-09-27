Оригинальная [презентация](https://mail.yandex.ru/disk/public/?hash=pcx9FvQ88XZe3XA6k%2BwNI1P8A6jWU7CYbsHJZ7vsF%2B4%3D).

Ещё интересные лекции Виктора:

- [Популярный Linux](http://events.yandex.ru/talks/105/)
- [Операционные системы](http://events.yandex.ru/talks/94/)
- [Сети и протоколы](http://events.yandex.ru/talks/99/)

**Домашнее задание**

Написать сценарий, который находит все файлы не входящие в SVN/Git и перемещает их в ~/.Trash/.

    git ls-files . --exclude-standard --others -z | xargs -0 -I {} mv {} ~/.Trash/

присылайте пулл реквесты с решением для SVN или с более элегантным подходом.


--> Вот мое решение - во-первых, строим директории, потом туда перемещаем файлы.
git status -s --untracked-files=all --porcelain | sed 's/?? //' | sed 's/\/[^/]*$' | grep '/' | xargs -i mkdir ~/.Trash/{}
git status -s --untracked-files=all --porcelain | sed 's/?? //' | xargs -i mv {} ~/.Trash/{}
