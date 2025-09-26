import { LightningElement } from 'lwc';
handleSearch(event)
{
    const searchKey = event.target.value.toLowerCase();
    this.filteredStudents = this.students.filter(student => student.Name.toLowerCase().includes(searchKey));
}

export default class StudentDashboard extends LightningElement {}