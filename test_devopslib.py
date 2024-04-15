from devopslib.randomfruit import fruit,meal


def test_fruit():
    fruit_choice = fruit()
    assert fruit_choice in ["apple", "pear", "lemon", "strawberry", "avocado", "cherry"]

def test_meal():
    result = meal("milk")
    assert "milk" in result 