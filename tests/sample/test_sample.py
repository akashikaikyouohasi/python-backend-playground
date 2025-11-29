"""
Test for sample module.
"""
from src.sample.sample import func


def test_answer():
    """
    Test func function.
    """
    assert func(3) == 4
