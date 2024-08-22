# Blood Banking Database Management System

## Project Overview

This project is a comprehensive Blood Banking Database Management System developed as a final project for the IFT 530 course. The system is designed to effectively manage and organize data related to blood donations, donors, patients, hospitals, and inventory within a blood bank.

## Features

- **Schema Design**: A well-structured database schema using Microsoft SQL Server 2012, featuring tables for donors, donations, patients, hospitals, and blood inventory.
- **Data Integrity**: Implementation of primary and foreign key constraints to ensure data consistency across the system.
- **Data Population**: Pre-populated tables with sample data for testing and demonstration purposes.
- **Views**:
  - `active_blood_requests`: Lists current blood requests including patient details, hospital information, and required blood types.
  - `active_donations_by_type`: Displays recent blood donations filtered by specific blood types (A+ and O+).
  - `low_inventory`: Identifies blood types with critically low inventory levels (less than 40 units).

## Usage

To use this system, execute the provided SQL scripts on a Microsoft SQL Server 2012 (SP1) instance. The database will be created with the necessary tables and views, which can then be queried to manage blood bank operations.

## ERD

The Entity-Relationship Diagram (ERD) outlines the relationships between the different tables in the database, emphasizing how data flows and interacts within the system.

## Summary

This project serves as a foundational database management system for blood banks, offering essential functionalities for tracking and managing blood donations, requests, and inventory.
