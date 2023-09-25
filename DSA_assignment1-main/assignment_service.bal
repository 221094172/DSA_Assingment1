    // AUTO-GENERATED FILE.
// This file is auto-generated by the Ballerina OpenAPI tool.
import ballerina/http;

configurable int port = 9090;


// listener http:Listener ep0 = new (9090, config = {host: "localhost"});

type Lecturers readonly & record {|
    int staffNumber;
    string officeNumber;
    string staffName;
    string title;
    string Courses;
|};
table<Lecturers> key(staffNumber) groups = table [
{staffNumber: 234, officeNumber: "12345", staffName: "Spillo", title: "Mr", Courses: "DSA"},
{staffNumber: 567, officeNumber: "87623", staffName: "Tjitouua", title: "Mr", Courses: "PRG"}
];

service / on new http:Listener(port) {
    # Get all players added to the application
    #
    # + return - A list of players 
    resource function get lecturers() returns Lecturers[] {
        return groups.toArray();
    }
    # Get a single player
    #
    # + return - player response 
    resource function get lecturer/[int staffNumber]() returns Lecturers?|http:NotFound & readonly {
        Lecturers? a_lecturer = groups[staffNumber];
        if (staffNumber==0) {
            return http:NOT_FOUND;
        } else {
          return a_lecturer;
        }
    }
    resource function post lecturer(Lecturers lect) returns Lecturers {
        groups.add(lect);
        return lect;
    }
}