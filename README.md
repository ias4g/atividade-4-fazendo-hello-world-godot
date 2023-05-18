# Atividade 04 - Fazendo Hello World Godot

### JOGOS DIGITAIS
<HR>

- INSTRUÇÕES:

>A partir do exemplo em sala (Aula 009) , faça um Game, que contenha dentro da "Interface" um Label que se move para as 4 direções e ao clicar em "espaço" , ele mude a sua própria cor. Não podendo sair da tela tanto para baixo, direita, esquerda ou cima.

Esta atividade foi feita com o Godot 3.5, para baixar [clica aqui](https://godotengine.org/download/3.x/windows/)

```

    extends ColorRect

    export (int) var velocity

    var width = 0
    var height = 0
    var space = false

    func _process(delta: float) -> void:
        
        getDimension()
        
        var right = 0
        var left = 0
        var up = 0
        var down = 0
        
        if Input.get_action_strength("ui_right"):
            right = 1
            $Label.text = "Right"
            self.color = Color(255, 0, 0, 1)
            pass
        
        if Input.get_action_strength("ui_left"):
            left = -1
            $Label.text = "Left"
            self.color = Color(0, 0, 0, 1)
            pass
        
        if Input.get_action_strength("ui_up"):
            up = -1
            $Label.text = "Up"
            self.color = Color(0, 0, 255, 1)
            pass
        
        if Input.get_action_strength("ui_down"):
            down = 1
            $Label.text = "Down"
            self.color = Color(255, 0, 255, 1)
            pass
        
        if get_position().x > (width - 120):
            right = 0
            pass
        
        if get_position().x <= 20:
            left = 0
            pass
        
        if get_position().y > (height - 120):
            down = 0
            pass
        
        if get_position().y <= 20:
            up = 0
            pass
        
        var x = velocity * delta * (right + left)
        var y = velocity * delta * (up + down)
        
        set_position(get_position() + Vector2(x, y))
        
        pass

    func getDimension() -> void:
        width = self.get_parent().get_parent_area_size().x
        height = self.get_parent().get_parent_area_size().y
        pass
```