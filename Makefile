package.zip: lambda_function.py requirements.txt
	pex3 venv create --layout flat-zipped --dir package --complete-platform complete_platform.json --no-build -r requirements.txt
	zip package.zip lambda_function.py

.PHONY: clean
clean:
	rm -rf package
	rm package.zip
