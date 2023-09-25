import ballerina/grpc;

listener grpc:Listener ep = new (9090);

Book[] books = [
    {title: "Rich dad Poor dad", author_1: "Robert Kiyosaki", author_2: "Sam", location: "r4p12", ISBN: "765-9-8447-2647-8", status: "AVAILABLE", price: 50.00},
    {title: "Game of thrones", author_1: "John Snow", author_2: "Lewis", location: "r7p3", ISBN: "378-9-3675-6453-9", status: "AVAILABLE", price: 29.99}
];

@grpc:Descriptor {value: LIBRARY_DESC}
service "Books" on ep {

    remote function getBook(string ISBN) returns Book|error {
         Book[] filteredBooks = books.filter(book => book.ISBN == ISBN);
        if filteredBooks.length() > 0 {
            return filteredBooks.pop();
        }

        return error grpc:NotFoundError(string `Cannot find the book for ISBN ${ISBN}`);
    }
    remote function addBook(Book book) returns Book|error {
         books.push(book);
         return book;
    }
    remote function listBooks() returns stream<Book, error?>|error {
        return books.toStream();
    }
}

