$ErrorActionPreference = 'Stop'
Set-Location -LiteralPath 'D:\PES\SEM-5\SE\LAB\L6_L7_38_elevator_dispatch\lab6'
$Host.UI.RawUI.WindowTitle = 'Lab 6 - Submission Coverage Results'

Write-Host 'LAB 6: CODE AND BRANCH COVERAGE' -ForegroundColor Cyan
Write-Host ''
Write-Host 'CODE COVERAGE' -ForegroundColor Cyan
Write-Host '> ..\.venv\Scripts\python.exe -m coverage run --data-file=.coverage_code --source=elevator_dispatch -m pytest -q CodeCoverageTest_elevator_dispatch.py'
& '..\.venv\Scripts\python.exe' -m coverage run --data-file=.coverage_code --source=elevator_dispatch -m pytest -q CodeCoverageTest_elevator_dispatch.py
if ($LASTEXITCODE -ne 0) { throw 'Code coverage tests failed.' }
Write-Host '> ..\.venv\Scripts\python.exe -m coverage report --data-file=.coverage_code -m --fail-under=90'
& '..\.venv\Scripts\python.exe' -m coverage report --data-file=.coverage_code -m --fail-under=90
if ($LASTEXITCODE -ne 0) { throw 'Code coverage is below 90%.' }

Write-Host ''
Write-Host 'BRANCH COVERAGE' -ForegroundColor Cyan
Write-Host '> ..\.venv\Scripts\python.exe -m coverage run --branch --data-file=.coverage_branch --source=elevator_dispatch -m pytest -q BranchCoverageTest_elevator_dispatch.py'
& '..\.venv\Scripts\python.exe' -m coverage run --branch --data-file=.coverage_branch --source=elevator_dispatch -m pytest -q BranchCoverageTest_elevator_dispatch.py
if ($LASTEXITCODE -ne 0) { throw 'Branch coverage tests failed.' }
Write-Host '> ..\.venv\Scripts\python.exe -m coverage report --data-file=.coverage_branch -m --fail-under=90'
& '..\.venv\Scripts\python.exe' -m coverage report --data-file=.coverage_branch -m --fail-under=90
if ($LASTEXITCODE -ne 0) { throw 'Branch-mode coverage is below 90%.' }
Write-Host ''
Write-Host 'Both coverage runs completed. Capture the results above for submission.' -ForegroundColor Green
