import ballerina/io;

BooksClient ep = check new ("http://localhost:9090");

public function main() returns error? {
    string getBookRequest = "ballerina";
    Book getBookResponse = check ep->getBook(getBookRequest);
    io:println(getBookResponse);

    Book addBookRequest = {title: "ballerina", author_1: "ballerina", author_2: "ballerina", location: "ballerina", ISBN: "ballerina", status: "ballerina", price: 1};
    string addBookResponse = check ep->addBook(addBookRequest);
    io:println(addBookResponse);
    stream<

Book, error?> listBooksResponse = check ep->listBooks();
    check listBooksResponse.forEach(function(Book value) {
        io:println(value);
    });
}

