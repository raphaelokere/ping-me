from flask import Flask, request, render_template
import boto3

app = Flask(__name__)

dynamodb = boto3.resource('dynamodb')
table = dynamodb.Table('YourDynamoDBTable')

@app.route('/', methods=['GET', 'POST'])
def home():
    if request.method == 'POST':
        org_name = request.form.get('OrganizationName')
        notes = request.form.get('Notes')

        table.put_item(
            Item={
                'Organization Name': org_name,
                'Notes': notes
            }
        )

    return render_template('index.html')

if __name__ == '__main__':
    app.run(debug=True)