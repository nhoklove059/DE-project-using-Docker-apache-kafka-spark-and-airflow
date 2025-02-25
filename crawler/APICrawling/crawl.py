import requests
import time
import pandas as pd
import os

# Base directory
BASE_DIR = 'F1_data'
ENDPOINT_DIRS = {
    'seasons': os.path.join(BASE_DIR, 'seasons'),
    'circuits': os.path.join(BASE_DIR, 'circuits'),
    'status': os.path.join(BASE_DIR, 'status'),
    'races': os.path.join(BASE_DIR, 'races'),
    'constructors': os.path.join(BASE_DIR, 'constructors'),
    'drivers': os.path.join(BASE_DIR, 'drivers'),
    'results': os.path.join(BASE_DIR, 'results'),
    'sprint': os.path.join(BASE_DIR, 'sprint'),
    'qualifying': os.path.join(BASE_DIR, 'qualifying'),
    'driver_standings': os.path.join(BASE_DIR, 'driver_standings'),
    'constructor_standings': os.path.join(BASE_DIR, 'constructor_standings'),
    'pitstops': os.path.join(BASE_DIR, 'pitstops'),
    'laps': os.path.join(BASE_DIR, 'laps')
}

# Create all directories if they don't exist
for dir_path in ENDPOINT_DIRS.values():
    os.makedirs(dir_path, exist_ok=True)

def fetch_paginated_data(base_url, path_keys=None, params=None, limit=100):
    all_data = []
    offset = 0
    total = None
    
    while True:
        current_params = {'limit': limit, 'offset': offset}
        if params:
            current_params.update(params)
            
        response = requests.get(base_url, params=current_params)
        response.raise_for_status()
        data = response.json()
        
        current_level = data
        if path_keys:
            for key in path_keys:
                current_level = current_level.get(key, {})
            items = current_level if isinstance(current_level, list) else []
        else:
            mr_data = data.get('MRData', {})
            table_key = list(mr_data.keys())[2]
            items = mr_data.get(table_key, [])
        
        all_data.extend(items)
        
        if total is None:
            total = int(data.get('MRData', {}).get('total', 0))
        
        if not items or len(all_data) >= total:
            break
            
        offset += limit
        time.sleep(0.5)
    
    return all_data

def export_to_csv(data, endpoint, filename):
    if data:
        df = pd.json_normalize(data)
        full_path = os.path.join(ENDPOINT_DIRS[endpoint], filename)
        df.to_csv(full_path, index=False)
        print(f"Exported {full_path} with {len(data)} records")

def get_seasons():
    url = "http://api.jolpi.ca/ergast/f1/seasons"
    path_keys = ["MRData", "SeasonTable", "Seasons"]
    seasons = fetch_paginated_data(url, path_keys)
    filtered_seasons = [s for s in seasons if 2000 <= int(s['season']) <= 2025]
    export_to_csv(filtered_seasons, 'seasons', 'seasons_2000_2025.csv')
    return filtered_seasons

def get_circuits():
    url = "http://api.jolpi.ca/ergast/f1/circuits"
    circuits = fetch_paginated_data(url)
    export_to_csv(circuits, 'circuits', 'circuits.csv')
    return circuits

def get_status():
    url = "http://api.jolpi.ca/ergast/f1/status"
    status = fetch_paginated_data(url)
    export_to_csv(status, 'status', 'status.csv')
    return status

def get_races(year):
    url = f"http://api.jolpi.ca/ergast/f1/{year}/races"
    races = fetch_paginated_data(url)
    export_to_csv(races, 'races', f'races_{year}.csv')
    return races

def get_constructors(year):
    url = f"http://api.jolpi.ca/ergast/f1/{year}/constructors"
    constructors = fetch_paginated_data(url)
    export_to_csv(constructors, 'constructors', f'constructors_{year}.csv')
    return constructors

def get_drivers(year):
    url = f"http://api.jolpi.ca/ergast/f1/{year}/drivers"
    drivers = fetch_paginated_data(url)
    export_to_csv(drivers, 'drivers', f'drivers_{year}.csv')
    return drivers

def get_results(year):
    url = f"http://api.jolpi.ca/ergast/f1/{year}/results"
    results = fetch_paginated_data(url)
    export_to_csv(results, 'results', f'results_{year}.csv')
    return results

def get_sprint(year):
    url = f"http://api.jolpi.ca/ergast/f1/{year}/sprint"
    sprint = fetch_paginated_data(url)
    export_to_csv(sprint, 'sprint', f'sprint_{year}.csv')
    return sprint

def get_qualifying(year):
    url = f"http://api.jolpi.ca/ergast/f1/{year}/qualifying"
    qualifying = fetch_paginated_data(url)
    export_to_csv(qualifying, 'qualifying', f'qualifying_{year}.csv')
    return qualifying

def get_driver_standings(year):
    url = f"http://api.jolpi.ca/ergast/f1/{year}/driverstandings"
    standings = fetch_paginated_data(url)
    export_to_csv(standings, 'driver_standings', f'driver_standings_{year}.csv')
    return standings

def get_constructor_standings(year):
    url = f"http://api.jolpi.ca/ergast/f1/{year}/constructorstandings"
    standings = fetch_paginated_data(url)
    export_to_csv(standings, 'constructor_standings', f'constructor_standings_{year}.csv')
    return standings

def get_pit_stops(year, round_num):
    url = f"http://api.jolpi.ca/ergast/f1/{year}/{round_num}/pitstops"
    path_keys = ["MRData", "RaceTable", "Races"]
    races = fetch_paginated_data(url, path_keys)
    pitstops = races[0].get('PitStops', []) if races else []
    export_to_csv(pitstops, 'pitstops', f'pitstops_{year}_round_{round_num}.csv')
    return pitstops

def get_laps(year, round_num):
    url = f"http://api.jolpi.ca/ergast/f1/{year}/{round_num}/laps"
    path_keys = ["MRData", "RaceTable", "Races"]
    races = fetch_paginated_data(url, path_keys)
    laps = races[0].get('Laps', []) if races else []
    export_to_csv(laps, 'laps', f'laps_{year}_round_{round_num}.csv')
    return laps

def main():
    seasons = get_seasons()
    print(f"Found {len(seasons)} seasons")
    
    for year in range(2000, 2026):
        print(f"\nFetching data for {year}:")
        
        races = get_races(year)
        print(f"Races: {len(races)}")
        
        constructors = get_constructors(year)
        print(f"Constructors: {len(constructors)}")
        
        drivers = get_drivers(year)
        print(f"Drivers: {len(drivers)}")
        
        round_num = 1
        while True:
            try:
                pitstops = get_pit_stops(year, round_num)
                if not pitstops and round_num > len(races):
                    break
                print(f"Round {round_num} pitstops: {len(pitstops)}")
                
                laps = get_laps(year, round_num)
                if not laps and round_num > len(races):
                    break
                print(f"Round {round_num} laps: {len(laps)}")
                
                round_num += 1
                
            except requests.exceptions.HTTPError as e:
                break
        
        if races:
            results = get_results(year)
            print(f"Results: {len(results)}")
            
            sprint = get_sprint(year)
            print(f"Sprint results: {len(sprint)}")
            
            qualifying = get_qualifying(year)
            print(f"Qualifying: {len(qualifying)}")
            
            driver_standings = get_driver_standings(year)
            print(f"Driver standings: {len(driver_standings)}")
            
            constructor_standings = get_constructor_standings(year)
            print(f"Constructor standings: {len(constructor_standings)}")

if __name__ == "__main__":
    circuits = get_circuits()
    print(f"Total circuits: {len(circuits)}")
    
    status = get_status()
    print(f"Total status codes: {len(status)}")
    
    main()