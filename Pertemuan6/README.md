# Manajemen Basis Data - Pertemuan 6

Docker Compose untuk 4 service basis data:

| Service    | Fungsi               | Alamat                |
| ---------- | -------------------- | --------------------- |
| MariaDB    | Database MySQL       | `localhost:3307`      |
| phpMyAdmin | GUI untuk MariaDB    | http://localhost:8081 |
| PostgreSQL | Database PostgreSQL  | `localhost:5433`      |
| pgAdmin    | GUI untuk PostgreSQL | http://localhost:5050 |

## Prasyarat

- Docker Desktop terpasang dan berjalan.
- Cek dengan `docker compose version`.

## Cara Menjalankan

1. Buat file `.env` di folder yang sama dengan `docker-compose.yaml`:

```env
   MARIADB_ROOT_PASSWORD=ganti_password_1
   POSTGRES_USER=postgres
   POSTGRES_PASSWORD=ganti_password_2
   PGADMIN_DEFAULT_EMAIL=admin@example.com
   PGADMIN_DEFAULT_PASSWORD=ganti_password_3
```

2. Jalankan semua service:

```bash
   docker compose up -d
```

3. Cek status. Semua harus `running` atau `healthy`:

```bash
   docker compose ps
```

## Login

**phpMyAdmin** (http://localhost:8081)

- Username: `root`
- Password: nilai `MARIADB_ROOT_PASSWORD`

**pgAdmin** (http://localhost:5050)

- Email: nilai `PGADMIN_DEFAULT_EMAIL`
- Password: nilai `PGADMIN_DEFAULT_PASSWORD`

Tambah server di pgAdmin:

- Host: `postgres`
- Port: `5432`
- Username: nilai `POSTGRES_USER`
- Password: nilai `POSTGRES_PASSWORD`

> Gunakan host `postgres` dan port `5432`, bukan `localhost:5433`.
> Alasan: pgAdmin berjalan di dalam jaringan Docker.

## Koneksi dari Komputer Lokal

```bash
# MariaDB
mysql -h 127.0.0.1 -P 3307 -u root -p

# PostgreSQL
psql -h 127.0.0.1 -p 5433 -U postgres
```

## Perintah Berguna

```bash
docker compose logs -f mariadb   # lihat log
docker compose stop              # hentikan service
docker compose down              # hapus container, data tetap
docker compose down -v           # hapus container DAN data
```

## Struktur

- Volume `mariadb`, `postgres`, `pgadmin` menyimpan data permanen.
- Network `mariadb` menghubungkan MariaDB dan phpMyAdmin.
- Network `postgres` menghubungkan PostgreSQL dan pgAdmin.
- Semua port hanya terbuka di `127.0.0.1`.

## Troubleshooting

- **Port bentrok**: ubah port kiri di `compose.yaml`, misalnya `3308:3306`.
- **Error `set in .env`**: variabel di `.env` belum diisi.
- **pgAdmin gagal konek**: pastikan host `postgres`, bukan `localhost`.

