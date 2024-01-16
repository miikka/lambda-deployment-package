from pydantic import BaseModel


class HelloEvent(BaseModel):
    name: str


def lambda_handler(event, context):
    hello_event = HelloEvent.model_validate(event)
    print(f"Hello, {hello_event.name}")
    return {"hello": hello_event.name}
