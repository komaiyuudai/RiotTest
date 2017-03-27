<todo>
    <h3>{ opts.title }</h3>

    <ul>
        <!-- 初期リストループ -->
        <li each={ items.filter(whatShow) }>
            <!-- done=trueのものはクラス設定、背景色の設定 -->
            <label class={ completed: done } style="background-color:{ color }">
            <!-- チェックがついたら「toggle」メソッドが実行され、「done」が変更される -->
            <input type="checkbox" checked={ done } onclick={ parent.toggle }> { title }
            <!-- 値が変更されたら「changeColor」メソッドが実行され、「color」が変更される -->
            <select onchange={ changeColor }>
                <!-- ステータスループ -->
                <option each={ status } value={ value }>{ name }</option>
            </select>
            </label>
        </li>
    </ul>

    <!-- submit時に「add」メソッドを実行 -->
    <form onsubmit={ add }>
        <!-- クリック後に「edit」メソッドを実行 -->
        <input name="input" onkeyup={ edit }>
        <!-- テキストが無い場合はdisabled、次のタスクが何個目なのかを表示 -->
        <button disabled={ !text }>Add #{ items.filter(whatShow).length + 1 }</button>
        <!-- 「done」がfalseの場合はdisabled(チェックがついていない場合)、クリック時に「removeAllDone」メソッドを実行、チェック数を表示 -->
        <button disabled={ items.filter(onlyDone).length == 0 } onclick={ removeAllDone }>X{ items.filter(onlyDone).length }</button>
    </form>

    <!-- this script tag is optional -->
    <script>
    // 使用する値の設定
    this.items = opts.items
    this.status = opts.status
    this.color = 'red'

    // テキストの設定
    edit(e) {
        this.text = e.target.value
    }

    // テキストが入っていたらsubmit可能で、submit後はテキストを空にする
    add(e) {
        if (this.text) {
            this.items.push({ title: this.text })
            this.text = this.input.value = ''
        }
    }

    // done=true(チェックがついている物)を削除
    removeAllDone(e) {
        this.items = this.items.filter(function(item) {
            return !item.done
        })
    }

    // hidden=trueの物を表示させない
    whatShow(item) {
        return !item.hidden
    }

    // done(チェックがついているか)を返す
    onlyDone(item) {
        return item.done
    }

    // doneの値を変更させる
    toggle(e) {
        var item = e.item
        item.done = !item.done
        return true
    }

    // リストの色を変更させる
    changeColor(e) {
        var value = e.target.options[e.target.selectedIndex].value
        var color

        switch (parseInt(value)){
            case 1:
                color = 'red'
                break;
            case 2:
                color = 'blue'
                break;
            case 3:
                color = 'green'
                break;
        }

        e.target.parentElement.style.backgroundColor = color
    }
    </script>

</todo>
