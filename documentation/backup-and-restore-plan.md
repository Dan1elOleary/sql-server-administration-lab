# Backup and Restore Plan

## Purpose

This document explains the backup and restore strategy for the `PublicSafetySupportDB` lab database.

## Backup Goals

The goal of the backup plan is to make sure the database can be recovered after accidental deletion, database corruption, system failure, or a failed application update.

## Backup Type

For this lab, the main backup type is a full database backup.

A full backup captures the entire database at the time the backup is created.

## Backup Schedule

Recommended lab schedule:

| Backup Type | Frequency | Storage Location |
|---|---:|---|
| Full Backup | Daily | Local backup folder |
| Restore Test | Weekly | Separate restore test database |

## Backup Location

Example backup path:

```text
C:\SQLBackups\
