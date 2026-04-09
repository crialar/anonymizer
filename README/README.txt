================================================================================
                          Anonymizer v6.2
                   Installation and User Manual
================================================================================

DESCRIPTION
-----------
Offline application for anonymizing bilingual memoQ documents.
Automatically detects and replaces sensitive information such as:

- Clinical trial IDs (22 formats: NCT, EudraCT, Protocol IDs, etc.)
- Personal information (emails, phone numbers, names, addresses)
- Biomedical entities (medications, laboratory products)
- Company, software, hardware, and product names (200+)
- Spanish ID numbers (NIF, CIF, DNI, NIE, with hyphen support)
- License plates (Spanish current and legacy formats)
- Long numeric identifiers (6+ digits)
- Custom terms via dictionary


PREREQUISITES
-------------
1. Windows 10 or later
2. Updated Google Chrome


INSTALLATION
--------------------------------------------------
1. Unzip this ZIP file into a folder of your choice  
   Example: C:\Anonymizer

2.  Double-click on Anonymizer.exe
    - The first time, it will automatically install the required offline
      dependencies (this may take 5-10 minutes)
    - On subsequent runs, it will start directly

Alternatively, if you already have Python installed (v3.12.10), you can install the dependencies and then run Anonymizer.bat to launch the application.


RUNNING THE APPLICATION
-----------------------
1. Double-click "Anonymizer.exe"
2. The application will open automatically in your browser
3. If it does not open, go manually to: http://localhost:5000


USING THE APPLICATION
---------------------
1. Upload MQXLIFF files (one or multiple)
2. Configure options:
   - Replacement token (default: REDACTED)
   - Enable/disable anonymization layers
   - Short segment exclusion filter
   - TM exclusion threshold for heavily anonymized segments

3. (Optional) Upload a dictionary of sensitive terms:
   - .txt file with one term per line
   - Also accepts comma-separated terms

4. Click "Process files"
5. Review changes in the "Preview" tab
6. Download anonymized files and/or Excel report

IMPORTANT: If any parsing errors occur, clear the cache from the top/right menu


INCLUDED FILES
--------------
- Anonymizer.exe         : Application launcher (one-click, built from build_exe.py)
- app.py                 : User interface (Streamlit)
- anonymizer.py          : Anonymization engine
- requirements.txt       : Dependency list
- README folder          : Manuals
- .streamlit/config.toml : Server configuration


