import json
from pydantic import BaseModel, Field


# === 1. Structured Output Schema ===
class FinancialAnalysis(BaseModel):
    company_name: str = Field(description="Name of the company evaluated")
    revenue: float = Field(description="Annual revenue in millions USD")
    key_risks: list[str] = Field(description="Top 3 identified operational risks")
    recommendation: str = Field(description="BUY, HOLD, or SELL")


# === 2. Autonomous Tool Calling Handler ===
def get_weather(location: str) -> str:
    """Mock weather service tool."""
    return f"Weather in {location} is 22°C and sunny."


available_tools = {
    "get_weather": get_weather,
}

tool_declarations = [
    {
        "type": "function",
        "function": {
            "name": "get_weather",
            "description": "Get the current weather for a specific city.",
            "parameters": {
                "type": "object",
                "properties": {
                    "location": {"type": "string", "description": "City name, e.g. London, Tokyo"}
                },
                "required": ["location"],
            },
        },
    }
]


def dispatch_tool_call(tool_call_name: str, arguments_json: str) -> str:
    func = available_tools.get(tool_call_name)
    if not func:
        return json.dumps({"error": f"Tool '{tool_call_name}' not recognized."})
    kwargs = json.loads(arguments_json)
    result = func(**kwargs)
    return json.dumps({"result": result})


if __name__ == "__main__":
    test_call = dispatch_tool_call("get_weather", json.dumps({"location": "Abuja"}))
    print("Tool Execution Result:", test_call)
