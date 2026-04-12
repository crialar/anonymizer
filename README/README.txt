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

Includes advanced anonymization layers.


PREREQUISITES
-------------
1. Windows 10 or later
2. Updated Google Chrome


INSTALLATION
--------------------------------------------------

Unzip this ZIP file into a folder of your choice
Example: C:\Anonymizer

Install Python 3.12.10 or similar if not already installed
Make sure to check both boxes: 
'Use admin privileges when installing pip' 
'Add python.exe to PATH

Double-click "script_requirements.bat"

This will install all required Python packages
Only needed the first time (may take 5-10 minutes)
Double-click "Anonymizer.bat" to launch the application

The application will open automatically in your browser
If it does not open, go manually to: http://localhost:5000


RUNNING THE APPLICATION
-----------------------
1. Double-click "Anonymizer.exe" or "Anonymizer.bat"
2. The application will open automatically in your browser
3. If it does not open, go manually to: http://localhost:5000


USING THE APPLICATION
---------------------
1. Upload MQXLIFF or TMX files (one or multiple)
2. Configure options:
   - Replacement token (default: ███)
   - Enable/disable anonymization layers
   - Safe Regex layer
   - Protected Terms (whitelist)
   - Short segment exclusion filter
   - TM exclusion threshold for heavily anonymized segments

3. (Optional) Upload a dictionary of sensitive terms:
   - .txt file with one term per line
   - Also accepts comma-separated terms

4. Click "Process files"
5. Review changes in the "Preview" tab
6. Download:
   - Anonymized files
   - Excel report
   - Clean TMX (without empty, excluded, or filtered segments)


TMX FILTERS
-----------
- Deduplication of identical or similar segments
- Short anonymized segment exclusion
- Heavily anonymized segment filtering (TM exclusion threshold)

IMPORTANT: If any parsing errors occur, clear the cache from the top/right menu


INCLUDED FILES
--------------
- Anonymizer.exe          : Application launcher
- Anonymizer.bat          : Application launcher
- app.py                  : User interface (Streamlit)
- anonymizer.py           : Anonymization engine
- requirements.txt        : Dependency list
- script_requirements.bat : All required Python packages
- README folder           : Manuals
- .streamlit/config.toml  : Server configuration