
## 🛠 Technologies Used

- **SQL** : MySQL / SQLite
- **Spreadsheet** : Microsoft Excel / Google Sheets
- **Python** : Python 3

---

## 📋 Assignment Sections

### 1. SQL (Hotel & Clinic Management System)

- Created database schemas with proper relationships
- Inserted sample data as per assignment
- Solved 5 queries for Hotel system
- Solved 5 queries for Clinic system

**Files:**
- `01_Hotel_Schema_Setup.sql` → Table creation + Data insertion
- `02_Hotel_Queries.sql` → 5 Hotel queries
- `03_Clinic_Schema_Setup.sql` → Table creation + Data insertion
- `04_Clinic_Queries.sql` → 5 Clinic queries

### 2. Spreadsheet Analysis (`Ticket_Analysis.xlsx`)

- Created `ticket` and `feedbacks` sheets with raw data
- Used formulas like `VLOOKUP`, `COUNTIFS`, `AVERAGEIFS`
- Added helper columns for same-day and same-hour analysis
- Performed outlet-wise ticket analysis

### 3. Python Scripts

**01_Time_Converter.py**
- Converts total minutes into readable "X hrs Y minutes" format
- Accepts user input with validation

**02_Remove_Duplicates.py**
- Removes duplicate characters from a string while preserving order
- Accepts user input with empty check

---

## 🚀 How to Run

### SQL
1. Open MySQL / SQLite
2. Run `01_Hotel_Schema_Setup.sql` first
3. Then run `02_Hotel_Queries.sql`
4. Run `03_Clinic_Schema_Setup.sql`
5. Then run `04_Clinic_Queries.sql`

### Python
```bash
cd Python

# Time Converter
python 01_Time_Converter.py

# Remove Duplicates
python 02_Remove_Duplicates.py