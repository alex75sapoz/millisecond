from src.main import lambda_handler

def test_lambda_handler(caplog):
    lambda_handler({}, {})

    assert 'This is at info level' in caplog.text
    assert 'This is at debug level' not in caplog.text