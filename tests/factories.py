# tests/factories.py
import factory
from factory.fuzzy import FuzzyChoice, FuzzyDecimal

from service.models import Product, Category

class ProductFactory(factory.Factory):
    class Meta:
        model = Product

    id = factory.Sequence(lambda n: n)
    name = FuzzyChoice(choices=["Hat", "Pants", "Shirt", "Apple", "Hammer"])
    description = factory.Faker("text")        # <-- key fix here
    price = FuzzyDecimal(0.5, 2000.0, 2)
    available = FuzzyChoice(choices=[True, False])
    category = FuzzyChoice(choices=[
        Category.UNKNOWN,
        Category.CLOTHS,
        Category.FOOD,
        Category.HOUSEWARES,
        Category.AUTOMOTIVE,
        Category.TOOLS,
    ])

__all__ = ["ProductFactory"]
