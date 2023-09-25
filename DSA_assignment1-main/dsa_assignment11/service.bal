import ballerina/http;

service /lecturers on new http:Listener(8080) {

     isolated resource function post .(@http:Payload LECTURERS lect) returns int|error? {
        return addLecturer(lect);
    }

    isolated resource function get [int staffNo]() returns LECTURERS|error? {
        return getLecturer(staffNo);
    }

    isolated resource function get .() returns LECTURERS[]|error? {
        return getAllLecturers();
    }

    isolated resource function put .(@http:Payload LECTURERS le) returns int|error? {
        return updateLecturer(le);
    }

    isolated resource function delete [int staffNo]() returns int|error? {
        return removeLecturer(staffNo);       
    }

    isolated resource function getOffice [string officeNo]() returns LECTURERS|error? {
        return getLecturerOffice(officeNo);
    }

    isolated resource function getCourse [string course]() returns LECTURERS|error? {
        return getLecturerCourse(course);
    }
}