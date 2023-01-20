---
name: DefaultTTL
parameters:
  - ttl
parameter_types:
  ttl: Duration
---

DefaultTTL sets the TTL for all records in a domain that do not explicitly set one with [TTL](../record/TTL.md). If neither `DefaultTTL` or `TTL` exist for a record,
it will use the DNSControl global default of 300 seconds.

```javascript
D('example.com', REGISTRAR, DnsProvider('R53'),
  DefaultTTL("4h"),
  A('@','1.2.3.4'), // uses default
  A('foo', '2.3.4.5', TTL(600)) // overrides default
);
```

The DefaultTTL duration is the same format as [TTL](../record/TTL.md), an integer number of seconds
or a string with a unit such as `'4d'`.