from dataclasses import dataclass, field
from datetime import datetime, timezone
from typing import Protocol


# === Protocol Interface (Structural Subtyping) ===
class PaymentProcessor(Protocol):
    def process_payment(self, amount: float) -> bool: ...


# === Concrete Implementations (Zero inheritance required) ===
class StripeProcessor:
    def process_payment(self, amount: float) -> bool:
        print(f"[Stripe] Charged ${amount:.2f}")
        return True


class PayPalProcessor:
    def process_payment(self, amount: float) -> bool:
        print(f"[PayPal] Processed ${amount:.2f}")
        return True


# === Modern Python 3.10+ Dataclass with slots ===
@dataclass(slots=True, frozen=True)
class Order:
    order_id: str
    amount: float
    created_at: datetime = field(default_factory=lambda: datetime.now(timezone.utc))

    def checkout(self, processor: PaymentProcessor) -> bool:
        if self.amount <= 0:
            raise ValueError("Order amount must be positive.")
        return processor.process_payment(self.amount)


if __name__ == "__main__":
    order = Order(order_id="ORD-101", amount=129.50)
    stripe = StripeProcessor()
    order.checkout(stripe)
